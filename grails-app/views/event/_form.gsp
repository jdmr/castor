<%@ page import="castor.Event" %>

<g:hiddenField name="code" value="${eventInstance?.code}" />
<g:hiddenField name="member.id" value="${eventInstance?.member?.id}" />

<div class="row">
    <div class="col-sm-6">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'name', 'has-error')} required">
            <label for="name">
                <g:message code="event.name.label" default="Name"/>
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="name" required="" value="${eventInstance?.name}" autofocus="autofocus" class="form-control" />
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'seats', 'has-error')} required">
            <label for="seats">
                <g:message code="event.seats.label" default="Seats"/>
                <span class="required-indicator">*</span>
            </label>
            <input type="number" name="seats" id="seats" value="${eventInstance.seats}" min="0" step="1" class="form-control" />
            <span class="help-block">When this number is reached we'll send a message explaining there are no more spots available. 0 = Unlimited.</span>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'description', 'has-error')} ">
            <label for="description">
                <g:message code="event.description.label" default="Description"/>

            </label>
            <g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${raw(eventInstance?.description)}" class="form-control wysiwyg" />
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'date', 'has-error')} required">
            <label for="date">
                <g:message code="event.date.label" default="Date"/>
                <span class="required-indicator">*</span>
            </label>
            <!-- <g:datePicker name="date" id="date" value="${eventInstance.date}"  precision="minute"
                          noSelection="['':'-Choose-']" relativeYears="[0..2]"/> -->

            <calendar:resources lang="en" theme="blue2"/>
            <calendar:datePicker name="date" defaultValue="${eventInstance.date}"  showTime="true" showReset="true" timeFormat="%I" />



        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-6">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'street', 'has-error')} ">
            <label for="street">
                <g:message code="event.street.label" default="Street"/>

            </label>
            <g:textField name="street" value="${eventInstance?.street}" class="form-control" />
        </div>
    </div>
    <div class="col-sm-2">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'city', 'has-error')} ">
            <label for="city">
                <g:message code="event.city.label" default="City"/>

            </label>
            <g:textField name="city" value="${eventInstance?.city}" class="form-control" />
        </div>
    </div>
    <div class="col-sm-2">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'state', 'has-error')} ">
            <label for="state">
                <g:message code="event.state.label" default="State"/>

            </label>
            <g:textField name="state" value="${eventInstance?.state}" class="form-control" />
        </div>
    </div>
    <div class="col-sm-2">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'zip', 'has-error')} ">
            <label for="zip">
                <g:message code="event.zip.label" default="ZIP Code"/>

            </label>
            <g:textField name="zip" value="${eventInstance?.zip}" class="form-control" />
        </div>
    </div>
</div>
