require("spec_helper.js");
require("../../public/javascripts/search_box.js");

Screw.Unit(function(){
  describe("With my search box and default text", function() {
    it("should remove the default text on focus", function() {
      expect($('#search #q').focus().attr('value')).to(equal, '');
    });
    it("should add default text when leaving if there is none", function() {
      expect($('#search #q').val('').blur().attr('value')).to(equal, 'Search for articles...');
    });
    it("should retain text when leaving field if text is present", function() {
      expect($('#search #q').val('example text').blur().attr('value')).to(equal, 'example text');
    });
  });
});

