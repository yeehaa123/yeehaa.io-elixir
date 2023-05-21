defmodule YeehaaWeb.PageHTML do
  use YeehaaWeb, :html
  import YeehaaWeb.HomepageHelperComponents
  import YeehaaWeb.BlobComponents

  embed_templates "page_html/*"
end
