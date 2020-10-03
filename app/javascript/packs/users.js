import 'jquery/src/jquery'
import 'jquery-ui'
import 'bootstrap'
import 'bootstrap/dist/js/bootstrap'
import '../src/users.scss'
import '@fortawesome/fontawesome-free/js/all'
import './custom'
import 'admin-lte'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("easy-autocomplete")

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
});
