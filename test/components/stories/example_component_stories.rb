class ExampleComponentStories < ViewComponent::Storybook::Stories
    story :hello_world do
        constructor(title: text("Button title")) do
            "Hello World!"
        end
    end
end