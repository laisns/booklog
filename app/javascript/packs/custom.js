$(document).ready(function (){
    $('a[data-toggle="tab"]').on('click', function (e) {
        // debugger;
        let target = this.href.split('#');
        $('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
    })
});
