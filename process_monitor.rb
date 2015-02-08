# This spec assumes process monitoring is being done through the god gem
#

is_god_installed = (`which god`.split("/")[-1] == "god\n")

describe "God" do

  it "should be installed" do
    expect(is_god_installed).to eql( "true")
  end

  unless is_god_installed == false
  
    it "services should all be 'up'" do
      god_status = (`sudo god status`).split("\n") 
      god_status.each do |e|
        unless e.split(": ")[1].nil?
          expect(e.split(": ")[1]).to eql("up")
        end
      end
    end
  end
end
