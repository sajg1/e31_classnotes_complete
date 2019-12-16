import React from "react";
import CommentBox from "./CommentBox";
import CommentList from "../components/CommentList";
import CommentForm from "../components/CommentForm";
import { shallow, mount } from "enzyme";

describe("CommentBox", () => {

  let wrapper;

  beforeEach(() => wrapper = shallow(<CommentBox />));

  it("should render correctly", () => {
    expect(wrapper).toMatchSnapshot();
  });

  it("should render a <div>", () => {
    expect(wrapper.find("div").length).toEqual(1);
  });

  it("should render two <h2>s", () => {
    expect(wrapper.find("h2").length).toEqual(2);
  });

  it("should render a CommentForm", () => {
    expect(wrapper.containsMatchingElement(<CommentForm />)).toEqual(true);
  });

  it("should render a CommentList", () => {
    expect(wrapper.containsMatchingElement(<CommentList />)).toEqual(true);
  });

  it("should render CommentForm and CommentList together", () => {
    expect(wrapper.containsAllMatchingElements([
      <CommentForm />,
      <CommentList />
    ])).toEqual(true);
  });


});


describe("Mounted CommentBox", () => {

  it("should call handleCommentDelete when the delete button is clicked", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentDelete");
    const wrapper = mount(<CommentBox/>);
    wrapper.find("#delete-button").simulate("submit");
    expect(spy).toHaveBeenCalledTimes(1);
  });

  it("should call handleCommentSubmit when a comment is submitted", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentSubmit");
    const wrapper = mount( < CommentBox /> );
    const form = wrapper.find("CommentForm");
    form.instance().setState({author: "Juan", text: "This is going to be really hard."});
    form.find("#submit-button").simulate("submit");
    expect(spy).toHaveBeenCalledTimes(1);
  });

});