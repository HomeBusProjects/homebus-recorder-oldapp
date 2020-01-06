// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery3
//= require moment
//= require tempusdominus-bootstrap-4.js
$(function () {
    $('#datetimepicker-start').datetimepicker({ buttons: {
            showToday: true,
            showClear: true,
            showClose: true
    }});
    $('#datetimepicker-end').datetimepicker({ buttons: {
            showToday: true,
            showClear: true,
            showClose: true
    }});
});
