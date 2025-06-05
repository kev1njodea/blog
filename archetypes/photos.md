+++
date = "{{ .Date }}"
title = "{{ replace .File.BaseFileName "-" " " | title }}"
slug = "{{ .File.BaseFileName | urlize }}"
image = "{{ .File.BaseFileName }}.jpg"
type = "gallery"
+++
