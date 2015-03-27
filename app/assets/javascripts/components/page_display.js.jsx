var PageContainer = React.createClass ({

	getInitialState: function () {
		return {
			entries: [],
			title: "",
		};
	},

	componentDidMount: function () {
		this.loadEntriesFromServer();
	},

	loadEntriesFromServer: function () {
		$.ajax({
		url: this.props.url,
		dataType: 'json',
		success: function (result) {
			var pageData = result;
			var title = pageData["title"];
			var entries = pageData["entries"];
			this.setState({title: title, entries: entries})
		}.bind(this),
		error: function (xhr, status, err) {
			console.error(this.props.url, status, err.toString());
		}.bind(this)
	});
	},

	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.state.title}</h1>
				<EntriesList entries={this.state.entries} />
				<NewEntryForm />
				<BackArrow />
				<NextArrow />
			</div>
			);
	}
});

var EntriesList = React.createClass ({
	render: function () {
	var entries = this.props.entries.map(function(entry){
		return (<EntryRow key={entry.id} entry={entry} />);
	});
		return (
			<div className="entries">
				{entries}
			</div>
			);
	}
});

var EntryRow = React.createClass ({
	render: function () {
		return (
			<p className={this.props.entry.user_pen_color.concat("-text")}>{this.props.entry.display_text}</p>
			);
	}
});

var NewEntryForm = React.createClass ({

	handleSubmit: function (e) {
		var entryInput = this.refs.content.getDOMNode().value;
		alert(entryInput);
		//var updatedEntries = this.state.entries.concat([entryInput]); this doesn't make sense here, state is only in the top level component
		//this is from "using refs" the way it gets the ref is helpful but i don't think we'll need to concat in this project
	},

	render: function () {
		return (
			<form>
				<p>be sure to add page_id and user_id here. hidden fields?</p>
				<div className="form-group">
					<textarea rows="5" className="form-control" placeholder="Add your answer!"  ref="content" />
				</div>
				<div className="form-group" id="anonymous-checkbox">
					<label>Check if you want to post anonymously</label>
					<input type="checkbox" className="margin-left" ref="anonymous" />
				</div>
				<div className="form-group">
					<button className="btn btn-primary" onClick={this.handleSubmit} >Submit</button>
				</div>
			</form>
			);
	}
});

var BackArrow = React.createClass ({
	render: function () {
		return (
			<div className="pull-left arrow">
				<img src="/assets/arrow-back.png"></img>
			</div>
			);
	}
});

var NextArrow = React.createClass ({
	render: function () {
		return (
			<div className="pull-right arrow">
				<img src="/assets/arrow-next.png"></img>
			</div>
			);
	}
});




var ready = function () {
	var current_page = $("#page_id").val();
	var current_user = $("#user_id").val();
	var json_url = "/pages/"+ current_page +".json";

  React.renderComponent(
    <PageContainer url={json_url} />,
    document.getElementById('page-container-component')
  );
};

$(document).ready(ready);

