var PageContainer = React.createClass ({
	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.props.title}</h1>
			</div>
			);
	}
});

var EntriesList = React.createClass ({
	render: function () {
	var entries = this.props.entries.map(function(entry){
		return (<EntryRow key={entry.display_text} entry={entry} />);
	});
		// return (
		// 	<div className="entries">
		// 	</div>
		// 	);
	}
});

var EntryRow = React.createClass ({
	render: function () {
		return (
			<p className={this.props.pen_color.concat("-text")}>{this.props.display_text}</p>
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