/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar = 'Basic',
	config.width = '75%',
	config.height = 350,
	config.uiColor = '#e1e1e1',
        config.filebrowserBrowseUrl = '/library/ckeditor/ckfinder/ckfinder.html',
	config.filebrowserImageBrowseUrl = '/library/ckeditor/ckfinder/ckfinder.html?type=Images',
	config.filebrowserFlashBrowseUrl = '/library/ckeditor/ckfinder/ckfinder.html?type=Flash',
	config.filebrowserUploadUrl = '/library/ckeditor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
	config.filebrowserImageUploadUrl = '/library/ckeditor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
	config.filebrowserFlashUploadUrl = '/library/ckeditor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'


};
