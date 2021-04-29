import $ from 'jquery';
import 'popper.js';
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

import CodeMirror from 'codemirror/lib/codemirror';
import 'codemirror/lib/codemirror.css';
import 'codemirror/mode/xml/xml';
import 'codemirror/theme/monokai.css'
import 'summernote/dist/summernote-bs4';
import 'summernote/dist/summernote-bs4.css';

$(".summernote").summernote({
    height: 150,   //set editable area's height
    codemirror: { // codemirror options
      CodeMirrorConstructor: CodeMirror,
      theme: 'monokai'
    }
});

$(document).on('turbolinks:load', function() {

  $('[data-provider="summernote"]').each(function() {
    $(this).summernote({
    });
  });

  $('#summernote').summernote();

  
});