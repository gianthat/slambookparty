var PageContainer = React.createClass ({
	render: function () {
		return (
			<div className="container page-container">
				<h1 className="text-center">{this.props.title}</h1>
			</div>
			);
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
			<img src="assets/arrow-back.png"></img>
			);
	}
});