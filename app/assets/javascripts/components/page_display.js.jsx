var PageContainer = React.createClass ({

	getInitialState: function () {
		return {
			newEntryContent: "If you're lost and you look then you will find me. Time after time!"
			};
	},

	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.props.title}</h1>
				<EntriesList entries={this.props.entries} />
				<NewEntryForm newEntryContent={this.state.newEntryContent} />
				<BackArrow />
				<NextArrow />
			</div>
			);
	}
});

var EntriesList = React.createClass ({
	render: function () {
	console.log(this.props.entries)
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

			// <p className={this.props.entry.user_pen_color.concat("-text")}>{this.props.entry.display_text}</p>
			<p>{this.props.entry.id} - {this.props.entry.content}</p>
			);
	}
});

var NewEntryForm = React.createClass ({

	handleSubmit: function (e) {
		var entryInput = this.refs.content.getDOMNode().value;
		alert(entryInput);
	},

	render: function () {
		return (
			<form>
			// don't forget to somehow add page_id and user_id here. hidden fields?
				<div className="form-group">
					<textarea rows="5" className="form-control" placeholder="Add your answer!" value={this.props.newEntryContent} ref="content" />
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