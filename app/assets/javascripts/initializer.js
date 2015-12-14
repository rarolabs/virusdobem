function celphoneMask(phone){
	if (phone.replace(/\D/g, "").length === 9) {
		return "00000-0000";
	} else {
		return "0000-00009";
	}
};

function celphonedddMask(phone){
	if (phone.replace(/\D/g, "").length === 11) {
		return "(00) 00000-0000";
	} else {
		return "(00) 0000-00009";
	}
};

function atualiza_campos_crud(){
	
	$("input.datepickermes").each(function(){
		if(!$(this).val()){
			$(this).val(moment().format("MM/YYYY"));
		}
	});
  
	$('input.datepickermes').datepicker({
		format: "mm/yyyy",
		viewMode: "months", 
    	minViewMode: "months"
	});	
	
	$("input.datepicker").each(function(){
		if(!$(this).val()){
			$(this).val(moment().format("DD/MM/YYYY"));
		}
	});
	
	$("input.mask-telefone-ddd").mask(celphonedddMask, {onKeyPress: function(val, e, field, options) {
			field.mask(celphonedddMask.apply({}, arguments), options);
	}});
	$("input.mask-telefone").mask(celphoneMask, {onKeyPress: function(val, e, field, options) {
		field.mask(celphoneMask.apply({}, arguments), options);
	}});
	
  
	$('input.datepicker').datepicker({
		format: "dd/mm/yyyy",
		todayBtn: "linked",
		keyboardNavigation: false,
		forceParse: false,
		calendarWeeks: true,
		autoclose: true
	});
	
	$(".timepicker").timepicker({
		minuteStep: 1,
		secondStep: 1,
		showInputs: false,
		showSeconds: true,
		showMeridian: false,
		disableFocus: true
	});
	
	$(".chosen").chosen();
	
	$('.i-checks').iCheck({
		checkboxClass: 'icheckbox_square-green',
		radioClass: 'iradio_square-green'
	});
	
	$('.raro_date_range').daterangepicker({
		format: 'DD/MM/YYYY',
		ranges: {
			'Hoje': [moment(), moment()],
			'Ontem': [moment().subtract('days', 1), moment().subtract('days', 1)],
			'Últimos 7 dias': [moment().subtract('days', 6), moment()],
			'Últimos 30 dias': [moment().subtract('days', 29), moment()],
			'Este Mês': [moment().startOf('month'), moment().endOf('month')],
			'Mês Passado': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
		},  
		startDate: moment().subtract('days', 60),
		endDate: moment()         
	},function(start, end) {
		$($(document.getElementById(this.element.context.id)).data('start-target')).val(start.format('YYYY-MM-DD 00:00'))
		$($(document.getElementById(this.element.context.id)).data('end-target')).val(end.format('YYYY-MM-DD 23:59'))
	});
	
	$("[data-provider='summernote']").each(function(){
		$(this).summernote({
			toolbar: [
				['font', ['bold', 'italic', 'underline', 'clear']],
				['para', ['ul', 'ol']],
				['table', ['table']],
				['insert', ['picture']],
				['view', ['codeview']]
			]	
		});
	});
	
	$('.modal').appendTo("body");
	
	$('.note-editor .note-dialog .modal').off('hidden.bs.modal')
	$('.note-editor .note-dialog .modal').on('hidden.bs.modal', function () {
		$(".note-dialog").appendTo($(".note-editor"));
	});
	
	$('.crud-new-record').off('click');
	$('.crud-new-record').on('click', function(){
		var select = $(this).siblings().last().find('select')
		var id = select.attr('id')
		var name = select.attr('name')
		new_record(id,name)
		buscaCidade();
		return false;
	});
	
	$(document).off('click', '[data-event$="Dialog"]');
	$(document).on('click', '[data-event$="Dialog"]', function (e) {
		$(".note-editor .note-dialog").appendTo("body");
		$('.modal-backdrop').appendTo("body");
	});
	
	$(document).off("click", ".add_nested_fields")
	$(document).on("click", ".add_nested_fields", function(){
		atualiza_campos_crud();
	});
	
	$(document).off('shown.bs.modal')
	$(document).on('shown.bs.modal', function (e) {
		$('.modal-backdrop').appendTo("body");
	});

	//BLOQUEIA USUARIO FAZER UPLOAD DE EXTENSAO INVALIDA
	$(document).off('change', "input[type='file'][id$='_arquivo']");
	$(document).on('change', "input[type='file'][id$='_arquivo']", function(e){
		$(this).parent().find("span.text-danger").remove();
		extension = $(this).val().substr($(this).val().length - ($(this).val().length - $(this).val().lastIndexOf(".")));
    extension = extension.toLowerCase();
		valid_extensions = $(this).attr('accept');
		if(valid_extensions.indexOf(extension) < 0){
			$(this).val("");
			$(this).parent().append("<span class='help-block m-b-none text-danger'>Não é permitido o envio de arquivos "+extension+", tipos permitidos: "+valid_extensions+"</span>")
		}
	});
};

$(document).ready(function (){
	$("li.menu").on('click', function (){
		$("li.active").removeClass("active");
		var atual = $(this)
		$("ul.collapse.in").each(function(index, e){
			if(!atual.parents().is(e)){
				$(e).collapse('hide');
			}
		});
		$(this).addClass("active");
	});

	$("li.parent-menu").on('click', function (){
		$(this).addClass("active");
	});
});