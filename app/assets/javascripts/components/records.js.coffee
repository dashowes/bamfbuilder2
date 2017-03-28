@Records = React.createClass
    getInitialState: ->
      records: @props.data
    getDefaultProps: ->
      records: []
    addRecord: (record) ->
      records = React.addons.update(@state.records, { $push: [record] })
      @setState records: records
    updateRecord: (record, data) ->
      index = @state.records.indexOf record
      records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
      @replaceState records: records
    deleteRecord: (record) ->
      index = @state.records.indexOf record
      records = React.addons.update(@state.records, { $splice: [[index, 1]] })
      @replaceState records: records
    render: ->
      React.DOM.div
        className: 'mainpage records'
        React.DOM.h2
          className: 'title'
          'What did YOU train today?'
        React.createElement RecordForm, handleNewRecord: @addRecord
        React.DOM.hr null
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Lift'
              React.DOM.th null, 'Weight'
              React.DOM.th null, 'Sets'
              React.DOM.th null, 'Reps'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for record in @state.records
              React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord
