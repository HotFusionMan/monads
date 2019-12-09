# frozen_string_literal: true

require 'benchmark/ips'

nil_value = nil
value = 1

Benchmark.ips do |x|
  x.report( 'value.nil? when nil' ) { nil_value.nil? }
  x.report( '!value when nil' ) { !nil_value }
  x.report( 'value.nil? when 1' ) { value.nil? }
  x.report( '!value when 1' ) { !value }

  x.compare!
end
