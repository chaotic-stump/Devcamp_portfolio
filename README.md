# Devcamp Portfolio Application

> This is a Ruby on Rails ~~5~~ 7 application that allows users to create their own portfolios, and is the demo application for the Dissecting Rails 5 course (upgraded to Rails 7).

### Features

* Real time chat engine for comments
* Blog
* Portfolio
* Drag and drop interface

### Code Example

```ruby
def my_great_method
  puts "here it is"
end
```

```javascript
alert('Hi there');
```

### Some key differences

- Nested Forms: Instead of using the Cocoon gem, Rails 7 uses Stimulus. I integrated a nested form component instead.
- Delete methods: use `method: :delete, data: { turbo_method: 'delete', turbo_confirm: 'Are you sure?' }` instead of whatever Rails 5 did.
