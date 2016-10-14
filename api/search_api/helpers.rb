module SearchApi
  module Helpers
    # merges filters params
    def merge_filters(f1, f2)
      f1[:brand_code] = '' if f2[:brand_code]
      f1[:type] = '' if f2[:type]
      f2.each { |k, v| f2[k] = (f1[k].to_s.split(',') + v.to_s.split(',')).uniq.join(',') if f1[k] }
      f1.merge(f2)
    end
    module_function :merge_filters

    # helper to trim filter label
    def sanitize_filter_label(label)
      label.gsub(/(?:^ *| *\(\d+\) *$)/, '')
    end

    # converts hash object to url params string
    def hash_to_params(hash = {})
      hash.map { |k, v| "#{k}=#{v}" }.join('&')
    end

    # converts url params string to hash object
    def params_to_hash(params = '')
      params.split(/&/).inject({}) do |hash, pair|
        key = pair.gsub(/=[^=]*$/, '')
        values = pair.gsub(/^[^=]*=/, '')
        hash.tap { |h| h[key] ? h[key] << values : h[key] = values }
      end.symbolize_keys
    end
  end
end
