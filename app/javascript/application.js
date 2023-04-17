// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require popper
//= require bootstrap-sprockets
import "@hotwired/turbo-rails"
import "controllers"

import "bootstrap"

const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))