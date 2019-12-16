import React, {Component} from "react";
import CommentList from "../components/CommentList";
import CommentForm from "../components/CommentForm";

class CommentBox extends Component {

  constructor(props) {
    super(props);
    this.state = {
      data: [{
          id: 1,
          author: "Colin",
          text: "Our comments are still hanging around."
        },
        {
          id: 2,
          author: "Jarrod",
          text: "React has converted me, I was wrong to be #teamjava."
        }
      ]
    };
    this.handleCommentSubmit = this.handleCommentSubmit.bind(this);
    this.handleCommentDelete = this.handleCommentDelete.bind(this);

  }

  handleCommentSubmit(submittedComment) {
    submittedComment.id = Date.now();
    const updatedComments = [...this.state.data, submittedComment];
    this.setState({
      data: updatedComments
    });
  }

  handleCommentDelete(evt) {
    evt.preventDefault();
    this.setState({
      data: []
    });
  }


  render() {
    return ( 
      <div className = "comment-box" >
        <h2>Add a Comment</h2> 
        <CommentForm onCommentSubmit = {this.handleCommentSubmit}/> 
        <h2>Comments</h2> 
        <CommentList data = {this.state.data}/> 
        <form onSubmit = {this.handleCommentDelete}>
          <input 
            id = "delete-button"
            type = "submit"
            value = "Delete Comments" 
          />
        </form> 
      </div>
    );
  }
}

export default CommentBox;
