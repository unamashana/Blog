# encoding: UTF-8
require 'iconv'
Dir.glob('*.html').each do|f|

	basename = File.basename(f, ".html")
  output_file = "#{basename}.md"

	content = File.read("#{basename}.html").
						encode('UTF-8', :invalid => :replace, :undef => :replace).
						gsub(/[^\x00-\x7F]/,' ').
						gsub(/\[\/*caption[^\]]*\]/,'')

	File.open(output_file,'w') do |f|
		f.write content
	end
end