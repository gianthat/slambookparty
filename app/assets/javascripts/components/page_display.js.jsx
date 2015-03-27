var PageContainer = React.createClass ({

	getInitialState: function () {
		return {
			entries: [],
			title: "",
		};
	},

	componentDidMount: function () {
		this.loadPageDataFromServer();
		setInterval(this.loadPageDataFromServer, this.props.pollInterval);
	},

	loadPageDataFromServer: function () {
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

	handleEntrySubmit: function(entry) {
		var entries = this.state.entries;
		var updatedEntries = entries.concat([entry]);
		this.setState({entries: updatedEntries});
		$.ajax({
			url: this.props.postUrl,
			dataType: 'json',
			type: 'POST',
			data: {"entry": entry},
			success: function(data) {
				this.loadPageDataFromServer();
			}.bind(this),
			error: function(xhr, status, err) {
				console.error(this.props.url, status, err.toString());
			}.bind(this)
		});
	},

	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.state.title}</h1>
				<EntriesList entries={this.state.entries} />
				<NewEntryForm onEntrySubmit={this.handleEntrySubmit}/>
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
		var userId = $("#user_id").val();
		var pageId = $("#page_id").val();
		var entryInput = this.refs.content.getDOMNode().value.trim();
		var anonymous = this.refs.anonymous.getDOMNode().value.trim();
		this.props.onEntrySubmit({user_id: userId, page_id: pageId, content: entryInput, anonymous: anonymous});
		this.refs.content.getDOMNode().value = '';
		this.refs.anonymous.getDOMNode().value = '';
		return false;
	},

	render: function () {
		return (
			<form onSubmit={this.handleSubmit}>
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
	var currentPage = $("#page_id").val();
	var jsonUrl = "/pages/"+ currentPage +".json";

  React.renderComponent(
    <PageContainer url={jsonUrl} pollInterval={2000} postUrl="/entries.json"/>,
    document.getElementById('page-container-component')
  );
};

$(document).ready(ready);

