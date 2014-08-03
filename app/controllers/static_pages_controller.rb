# -*- encoding : utf-8 -*-
require 'mecab'

class StaticPagesController < ApplicationController
  def home
    @word_array = []
    n = MeCab::Tagger.new.parseToNode('今日は日曜日。明日は月曜日。')
    while n
      @word_array << n.surface
      n = n.next
    end
    @word_array.reject! { |c| c.empty? }
  end
end
