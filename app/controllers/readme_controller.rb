class ReadmeController < ApplicationController
  def readme
    filename = File.join(Rails.root, 'README.md')
    begin
      file = File.open(filename)
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          autolink: true,
                                          space_after_headers: true,
                                          fenced_code_blocks: true,
                                          underline: true,
                                          highlight: true,
                                          footnotes: true,
                                          tables: true)
      render text: @markdown.render(file.read.force_encoding('UTF-8')).html_safe, layout: true
    rescue Errno::ENOENT
      render file: 'public/404.html', status: 404
    end
  end
end
