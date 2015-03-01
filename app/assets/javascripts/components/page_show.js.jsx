var Comment = React.createClass({
  render: function () {
    return (
      <div className="comment text-center">
        <h2>React Testing</h2>
        <h2 className="commentAuthor">
          Author: {this.props.author}
        </h2>
          Comment: {this.props.comment}
      </div>
      );
  }
});

// var ready = function () {
//   React.renderComponent(
//     <Comment author="Kathy" comment="This is a hardcoded entry "/>,
//     document.getElementById('entries-react-placeholder')
//   );
// };

// $(document).ready(ready);