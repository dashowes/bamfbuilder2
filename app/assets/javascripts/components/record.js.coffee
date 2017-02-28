@Record = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.record.date
        React.DOM.td null, @props.record.title
        React.DOM.td null, weightFormat(@props.record.weight)
        React.DOM.td null, @props.record.sets
        React.DOM.td null, @props.record.reps