@Record = React.createClass
    getInitialState: ->
      edit: false
    handleToggle: (e) ->
      e.preventDefault()
      @setState edit: !@state.edit
    handleEdit: (e) ->
      e.preventDefault()
      data =
        date: React.findDOMNode(@refs.date).value
        title: React.findDOMNode(@refs.title).value
        weight: React.findDOMNode(@refs.weight).value
        sets: React.findDOMNode(@refs.sets).value
        reps: React.findDOMNode(@refs.reps).value
      $.ajax
        method: 'PUT'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        data:
          record: data
        success: (data) =>
          @setState edit: false
          @props.handleEditRecord @props.record, data
    handleDelete: (e) ->
      e.preventDefault()
      $.ajax
        method: 'DELETE'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteRecord @props.record
    recordRow: ->
      React.DOM.tr null,
        React.DOM.td null, @props.record.date
        React.DOM.td null, @props.record.title
        React.DOM.td null, weightFormat(@props.record.weight)
        React.DOM.td null, @props.record.sets
        React.DOM.td null, @props.record.reps
        React.DOM.td null,
            React.DOM.a
                className: 'btn btn-default'
                onClick: @handleToggle
                'Edit'
            React.DOM.a
                className: 'btn btn-danger'
                onClick: @handleDelete
                'Delete'
    recordForm: ->
      React.DOM.tr null,
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.record.date
            ref: 'date'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.record.title
            ref: 'title'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'number'
            defaultValue: @props.record.weight
            ref: 'weight'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'number'
            defaultValue: @props.record.sets
            ref: 'sets'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'number'
            defaultValue: @props.record.reps
            ref: 'reps'
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-default'
            onClick: @handleEdit
            'Update'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleToggle
            'Cancel'
    render: ->
        if @state.edit
            @recordForm()
        else
            @recordRow()