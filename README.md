# HexletCode

[![Tests](https://github.com/Peredery/rails-project-lvl1/actions/workflows/tests.yml/badge.svg)](https://github.com/Peredery/rails-project-lvl1/actions/workflows/tests.yml)
[![hexlet-check](https://github.com/Peredery/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Peredery/rails-project-lvl1/actions/workflows/hexlet-check.yml)


Generate html


## Usage

Examples for tags
```ruby
HexletCode::Tag.build('br')
# <br>

HexletCode::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image">

HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">

# Для парных тегов тело передается как блок
HexletCode::Tag.build('label') { 'Email' }
# <label>Email</label>

HexletCode::Tag.build('label', for: 'email') { 'Email' }
# <label for="email">Email</label>

HexletCode::Tag.build('div')
# <div></div>
```

Example for forms
```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>
```
