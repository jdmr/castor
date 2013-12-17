<%@ page import="castor.Message" %>



<div class="form-group ${hasErrors(bean: messageInstance, field: 'name', 'has-error')} required">
	<label for="name">
		<g:message code="message.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${messageInstance?.name}" class="form-control" readonly="true" />
</div>

<div class="form-group ${hasErrors(bean: messageInstance, field: 'subject', 'has-error')} ">
    <label for="subject">
        <g:message code="message.subject.label" default="Subject" />

    </label>
    <g:textField name="subject" value="${messageInstance?.subject}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: messageInstance, field: 'content', 'has-error')} ">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="4000" value="${raw(messageInstance?.content)}" class="form-control wysiwyg" />

</div>

<div class="form-group">
    <dl class="dl-horizontal">
        <dt>@@NAME@@</dt>
        <dd>User's First Name</dd>
        <dt>@@USERNAME@@</dt>
        <dd>User's email.</dd>
        <dt>@@PASSWORD@@</dt>
        <dd>User's password. This can only be used in the SIGN_UP Message.</dd>
        <dt>@@CODE@@</dt>
        <dd>RSVP Code</dd>
        <dt>@@EVENT@@</dt>
        <dd>Event Name</dd>
    </dl>
</div>

