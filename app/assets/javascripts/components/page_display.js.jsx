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
			var backUrl = pageData["back_url"];
			var nextUrl = pageData["next_url"];
			this.setState({title: title, entries: entries, backUrl: backUrl, nextUrl: nextUrl})
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
				console.error(this.props.postUrl, status, err.toString());
			}.bind(this)
		});
	},

	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.state.title} </h1>
				<EntriesList entries={this.state.entries} />
				<NewEntryForm onEntrySubmit={this.handleEntrySubmit} />
				<BackArrow backUrl={this.state.backUrl} />
				<NextArrow nextUrl={this.state.nextUrl} />
			</div>
			);
	}
});

var EntriesList = React.createClass ({
	render: function () {
	var entries = this.props.entries.map(function(entry){
		var entryUrl = "/entries/" + entry.id;
		var entryUserId = entry.user_id;
		var userId = $("#user_id").val();
		if (entryUserId == userId) {
			var deleteableClass = "deleteable-entry"
		} else {
			var deleteableClass = "undeletable"
		}
		return (<EntryRow key={entry.id} entry={entry} entryUrl={entryUrl} deleteableClass={deleteableClass} />);
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
			<p className={this.props.deleteableClass} >
			<span className={this.props.entry.user_pen_color.concat("-text")} > 
			{this.props.entry.display_text}
			</span>
			<a data-confirm="You really want to delete your entry?" className="pink-hover margin-left" rel="nofollow" data-method="delete" href={this.props.entryUrl}>
				<i className="glyphicon glyphicon-trash"></i>
			</a>
			</p>
			);
	}
});

var NewEntryForm = React.createClass ({

	handleSubmit: function (e) {
		var userId = $("#user_id").val();
		var pageId = $("#page_id").val();
		var entryInput = this.refs.content.getDOMNode().value.trim();
		var anonymous = this.refs.anonymous.getDOMNode().checked;
		this.props.onEntrySubmit({user_id: userId, page_id: pageId, content: entryInput, anonymous: anonymous});
		this.refs.content.getDOMNode().value = '';
		this.refs.anonymous.getDOMNode().checked = false;
		e.preventDefault();
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
			<a href={this.props.backUrl}>
				<img src="/assets/arrow-back.png" alt="Arrow next" />
			</a>
			</div>
			);
	}
});

var NextArrow = React.createClass ({
	render: function () {
		return (
			<div className="pull-right arrow">
			<a href={this.props.nextUrl}>
				<img src="/assets/arrow-next.png" alt="Arrow next" />
			</a>
			</div>
			);
	}
});




var ready = function () {
	var currentPage = $("#page_id").val();
	var jsonUrl = "/pages/"+ currentPage +".json";

  React.render(
    <PageContainer url={jsonUrl} pollInterval={10000} postUrl="/entries.json"/>,
    document.getElementById('page-container-component')
  );
};

$(document).ready(ready);

