<%@ page import="castor.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="message.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${messageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="4000" value="${messageInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="message.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${messageInstance?.subject}"/>
</div>

