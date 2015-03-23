var PageContainer = React.createClass ({
	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.props.title}</h1>
				<EntriesList entries={this.props.entries} />
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
			// <p className={this.props.entry.user.pen_color.concat("-text")}>{this.props.entry.display_text}</p>
			<p>{this.props.entry.id} - {this.props.entry.content}</p>
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