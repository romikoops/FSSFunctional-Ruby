module SearchApi::Helpers
  def merge_filters(f1, f2)
    f2.each  { |k, v| f2[k] = (f1[k].to_s.split(',') + v.to_s.split(',')).uniq.join(',') if f1[k] }
    f1.merge(f2)
  end

  def sanitize_filter_label(label)
    label.gsub(/(?:^ *| *\(\d+\) *$)/, '')
  end

  def hash_to_params(hash={})
    hash.map { |k, v| "#{k}=#{v}" }.join('&')
  end

  def params_to_hash(params='')
    params.split(/&/).inject({}) do |hash, pair|
      key = pair.gsub(/=[^=]*$/, '')
      values = pair.gsub(/^[^=]*=/, '')
      hash.tap { |h| h[key] ? h[key] << values : h[key] = values }
    end.symbolize_keys
  end
end