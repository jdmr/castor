<%@ page import="castor.User" %>

<div class="form-group ${hasErrors(bean: userInstance, field: 'name', 'has-error')} ">
    <label for="name">
        <g:message code="user.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${userInstance?.name}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'has-error')} required">
    <label for="username">
        <g:message code="user.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
    <input type="email" name="username" required="required" value="${userInstance?.username}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password" required="" value="${userInstance?.password}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'phone', 'has-error')} ">
    <label for="phone">
        <g:message code="user.phone.label" default="Phone"/>

    </label>
    <g:textField name="phone" value="${userInstance?.phone}" class="form-control" />
</div>

<div class="checkbox ${hasErrors(bean: userInstance, field: 'enabled', 'has-error')} ">
    <label for="enabled">
        <g:checkBox name="enabled" value="${userInstance?.enabled}"/>
        <g:message code="user.enabled.label" default="Enabled"/>
    </label>
</div>

<div class="checkbox ${hasErrors(bean: userInstance, field: 'accountExpired', 'has-error')} ">
    <label for="accountExpired">
        <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
        <g:message code="user.accountExpired.label" default="Account Expired"/>
    </label>
</div>

<div class="checkbox ${hasErrors(bean: userInstance, field: 'accountLocked', 'has-error')} ">
    <label for="accountLocked">
        <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
        <g:message code="user.accountLocked.label" default="Account Locked"/>
    </label>
</div>

<div class="checkbox ${hasErrors(bean: userInstance, field: 'passwordExpired', 'has-error')} ">
    <label for="passwordExpired">
        <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
        <g:message code="user.passwordExpired.label" default="Password Expired"/>
    </label>
</div>

