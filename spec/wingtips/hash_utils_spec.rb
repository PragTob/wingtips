require 'spec_helper'

RSpec.describe Wingtips::HashUtils do
  describe '.deep_merge' do
    it 'merges non conflicting hashes okay' do
      result = Wingtips::HashUtils.deep_merge({a: 1}, {b:2})
      expect(result).to eq({a:1, b:2})
    end

    it 'resolves easy conflicts ok' do
      result = Wingtips::HashUtils.deep_merge({a: 1}, {a: 20})
      expect(result).to eq({a: 20})
    end

    it 'merges hashes fine one step down' do
      result = Wingtips::HashUtils.deep_merge({app: {fullscreen: true}},
                               {app: {title: 'lala'}})
      expect(result).to eq({app: {fullscreen: true, title: 'lala'}})
    end

    it 'merges them fine even 3 steps down' do
      result = Wingtips::HashUtils.deep_merge({a: {b: {c: {d: 1, e: 5}}}},
                                    {a: {b: {c: {d: 20, f: 9}}}})
      expect(result).to eq({a: {b: {c: {d: 20, e: 5, f:9}}}})
    end

    it 'does not modify the first hash' do
      first = {a: 5}
      Wingtips::HashUtils.deep_merge first, {b: 7}
      expect(first).to eq({a: 5})
    end
  end

  describe '.deep_merge!' do
    it 'modifies the first hash' do
      first = {a: 5}
      Wingtips::HashUtils.deep_merge! first, {b: 7}
      expect(first).to eq({a: 5, b: 7})
    end
  end
end