class UpgradeAttacheFieldsFromV2ToV3 < ActiveRecord::Migration
  class User < ActiveRecord::Base; serialize :avatar, JSON; end
  class User < ActiveRecord::Base; serialize :photos, JSON; end

  def self.up
    # has_one_attache
    User.where.not(avatar: [nil, ""]).find_each do |obj|
      if obj[:avatar].kind_of?(String)
        obj.update(avatar: JSON.parse(obj[:avatar]))
      end
    end

    # has_many_attaches
    User.where.not(photos: [nil, ""]).find_each do |obj|
      if obj[:photos].first.kind_of?(String)
        obj.update(photos: obj[:photos].collect {|v| JSON.parse(v) })
      end
    end
  end

  def self.down
    # has_one_attache
    User.where.not(avatar: [nil, ""]).find_each do |obj|
      if obj[:avatar].kind_of?(Hash)
        obj.update(avatar: obj[:avatar].to_json)
      end
    end

    # has_many_attaches
    User.where.not(photos: [nil, ""]).find_each do |obj|
      if obj[:photos].first.kind_of?(Hash)
        obj.update(photos: obj[:photos].collect {|v| v.to_json })
      end
    end
  end
end
