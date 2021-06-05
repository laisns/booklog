import 'jquery/src/jquery'
import 'jquery-ui'
import 'bootstrap'
import 'bootstrap/js/dist/alert'
import 'bootstrap/js/dist/util'
import 'bootstrap/dist/js/bootstrap'
import '../src/users.scss'
import '@fortawesome/fontawesome-free/js/all'
import './custom'
import './datatables'
import 'admin-lte'
import 'admin-lte/dist/js/adminlte'
import 'datatables.net/js/jquery.dataTables.min'
import 'datatables.net-bs4/js/dataTables.bootstrap4.min'
import './users/custom_datepicker'
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("easy-autocomplete")
require("jsgrid/dist/jsgrid.min")

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
});
