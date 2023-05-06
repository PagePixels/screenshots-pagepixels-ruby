# PagePixels Screenshots

PagePixels is an API and web interface that provides automated screenshot capturing and change notifications for your web pages. With PagePixels, you can easily capature immediate screenshots, schedule recurring screenshots, set up change notifications, and use multi-step screenshotting functionality to complete forms, click links, and login to websites prior to taking screenshots.

## Getting Started
To use PagePixels, sign up for a free account and obtain your API key. No payment information is required. You can sign up and create an API key by visiting the PagePixels website https://pagepixels.com.

Once you have your API key, you can start making requests to the API.

## Installation

To install the `screenshots_pagepixels` gem, you can use the following command:

```
gem install screenshots_pagepixels
```

Alternatively, you can add the following line to your Gemfile:

```
gem 'screenshots_pagepixels'
```

And then run `bundle install` to install the gem.

Once the gem is installed, you can require it in your Ruby code:

```ruby
require 'screenshots_pagepixels'
```

## Usage
The `ScreenshotsPagepixels` RubyGem provides a simple and intuitive way to interface with the PagePixels API. The `ScreenshotsPagepixels::Client` class provides the following methods.

Learn more about configuring your screenshot options here: 

https://pagepixels.com/app/documentation#api-options

### `snap(options = {})`
Captures a screenshot of a web page immediately.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
options = { url: 'https://www.example.com' }
client.snap(options)
```

### `create_screenshot_config(options = {})`
Creates a new screenshot configuration, which can include an automatically recurring schedule, multi-step configurations, and more. 

Learn more about multi-step (click links, complete forms, login to websites, etc) functionality here: 

https://pagepixels.com/app/documentation#multi-step-screenshots

Learn more about configuring scheduled screenshots here: 

https://pagepixels.com/app/documentation#scheduled-screenshots

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
options = { url: 'https://www.example.com', scheduled_screenshot: true, scheduled_every: 1, scheduled_interval: 'days' }
client.create_screenshot_config(options)
```

### `screenshot_configs(options = {})`
Allows you to retrieve your screenshot configurations.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.screenshot_configs
```

### `get_screenshot_config(id)`
Gets a specific screenshot configuration.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.get_screenshot_config('your-screenshot-config-id')
```

### `update_screenshot_config(id, options = {})`
Updates a specific screenshot configuration.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
options = { scheduled_every: 2 }
client.update_screenshot_config('your-screenshot-config-id', options)
```

### `delete_screenshot_config(id)`
Deletes a specific screenshot configuration.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.delete_screenshot_config('your-screenshot-config-id')
```

### `screenshot_config_screenshots(id, options = {})`
Retrieves a list of screenshots that were taken with a specific screenshot configuration.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.screenshot_config_screenshots('your-screenshot-config-id')
```

### `screenshot_config_change_notifications(id, options = {})`
Provides an array of all Change Notifications for a specific screenshot configuration.

Learn more about configuring change notifications for your screenshots here: 

https://pagepixels.com/app/documentation#screenshot-change-notifications

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.screenshot_config_change_notifications('your-screenshot-config-id')
```

### `job_status(job_id)`
Retrieves the status of a specific screenshot job associated with a screenshot configuration.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.job_status('your-job-id')
```

### `capture_screenshot(id)`
Immediately captures a screenshot using a specific screenshot configuration. This bypasses all scheduling to take a screenshot immediately.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.capture_screenshot('your-screenshot-config-id')
```

### `screenshots(options = {})`
Retrieves a list of all screenshots taken with your PagePixels account.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.screenshots
```

### `change_notifications(options = {})`
Provides an array of all Change Notifications for all screenshot configurations.

```ruby
require 'screenshots_pagepixels'

client = ScreenshotsPagepixels::Client.new('your-api-key')
client.change_notifications
```

# Some additional helpful information.

## Scheduling
With PagePixels, you can schedule recurring screenshots of your web pages. You can schedule screenshots through the user interface as well if needed.

The following options are available for scheduling:

| Option               | Expected Value        |
| --------------------| ----------------------|
| scheduled_screenshot | true or false         |
| scheduled_every      | Integer greater than 1|
| scheduled_interval   | Any of: minutes, hours, days, weeks, months, years |

## Multi-Step Screenshots
PagePixels also provides the ability to use multi-step functionality to complete forms, navigate to different pages, click links and buttons, and login to your favorite websites prior to taking your screenshot.

The following actions are available for use with the multi-step functionality:

| Action                   | Example                                                            |
| ------------------------| -------------------------------------------------------------------|
| Click                    | {"type": "click", "selector": "#your-selector"}                    |
| Hover                    | {"type": "hover", "selector": "#your-selector"}                    |
| Change Notification      | {"type": "change", "selector": "#your-selector", "send_to": "webhook", url: "https://example.com/webhook-url"} |
| Goto URL                 | {"type": "redirect", "value": "https://example.com"}               |
| Run Javascript           | {"type": "javascript", "value": "console.log('my javascript');"}    |
| Insert CSS               | {"type": "css", "value": "#selector{ color: red }"}                 |
| Text Field Input         | {"type": "text_field", "selector": "#the-text-field", "value": "your-value"} |
| Dropdown Field Selection | {"type": "select", "selector": "#the-dropdown-field", "value": "selected value"} |
| Checkbox Field Input     | {"type": "checkbox", "selector": "#the-checkbox-field", "value":true} |
| Press Enter              | (to submit hidden forms) {"type": "submit"}                         |
| Wait X milliseconds      | {"type": "wait", "value": "5000"}                                   |
| Wait for Selector        | {"type": "wait_for_selector", "selector": "#your-selector"}         |
