<html>
<head>
	<meta name='layout' content='main'/>
	<title>RSVP</title>
</head>

<body>

    <div class="content">
        <g:form action="rsvp" method="post" >
            <input type="hidden" name="event.id" id="eventId" value="${party.event.id}">
            <div class="row">
                <div class="col-sm-12">
                    <legend><h1>RSVP</h1></legend>
                </div>
                <div class="col-sm-12">
                    <g:if test='${flash.message}'>
                        <div class='alert alert-danger'>${flash.message}</div>
                    </g:if>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group ${hasErrors(bean: party, field: 'fullName', 'has-error')}">
                        <label for='fullName'>Full Name</label>
                        <input type='text' class='form-control' name='fullName' id='fullName' autofocus="autofocus" value="${party.fullName}"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group ${hasErrors(bean: party, field: 'email', 'has-error')}">
                        <label for='email'>Email</label>
                        <input type='email' class='form-control' name='email' id='email' value="${party.email}" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group ${hasErrors(bean: party, field: 'phone', 'has-error')}">
                        <label for='phone'>Phone</label>
                        <input type='tel' class='form-control' name='phone' id='phone' value="${party.phone}" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group ${hasErrors(bean: party, field: 'seats', 'has-error')}">
                        <label for='seats'>Seats</label>
                        <input type='number' class='form-control' name='seats' id='seats' min="1" value="${party.seats}"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group ${hasErrors(bean: party, field: 'comments', 'has-error')}">
                        <label for='comments'>Comments</label>
                        <textarea class='form-control' name='comments' id='comments' >${party.comments}</textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-plus"></i> RSVP</button>
                </div>
            </div>
        </g:form>
    </div>
</body>
</html>
