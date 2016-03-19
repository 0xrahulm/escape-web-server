require 'spec_helper'

describe ApiConstraints do 
	let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
	let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }

	describe 'matches?' do
		it "return true when the version matches the 'Accept' Header" do
			request = double(host: 'api.escape-app.dev', headers: {"Accept" => "application/version.v1"} )
			expect(api_constraints_v1.matches?(request)).to be_truthy 
		end

		it "return the default version when default 'option' is specified" do
			request = double(host: 'api.escape-app.dev')
			expect(api_constraints_v2.matches?(request)).to be_truthy 
		end
	end
end