@RecordForm = React.createClass
    getInitialState: ->
      title: ''
      date: ''
      weight: ''
      sets: ''
      reps: ''
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    valid: ->
      @state.title && @state.date && @state.weight && @state.sets && @state.reps
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { record: @state }, (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      , 'JSON'
      
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Date'
            name: 'date'
            value: @state.date
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Lift'
            name: 'title'
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Weight'
            name: 'weight'
            value: @state.weight
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Sets'
            name: 'sets'
            value: @state.sets
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Reps'
            name: 'reps'
            value: @state.reps
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'hellyeahbtn'
          disabled: !@valid()
          'Hell yeah.'