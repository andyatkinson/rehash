require("spec_helper.js");
require("../../public/javascripts/search_box.js");
require("../../public/javascripts/new_comment.js");

Screw.Unit(function(){
  describe("With my search box and default text", function() {
    it("should remove the default text on focus", function() {
      expect($('#search #q').focus().attr('value')).to(equal, '');
    });
    // TODO FIXME failed with setting value attr in template for i18n
    // it("should add default text when leaving if there is none", function() {
    //   expect($('#search #q').val('').blur().val()).to(equal, 'Search for articles...');
    // });
    it("should retain text when leaving field if text is present", function() {
      expect($('#search #q').val('example text').blur().attr('value')).to(equal, 'example text');
    });
  });
  
  describe("Posting a comment", function() {
    it("should disable button and replace text", function() {
      expect($('#comment_submit').click().attr('disabled')).to(equal, true);
      expect($('#comment_submit').click().val()).to(equal, 'Please wait...');
    });
  });
});