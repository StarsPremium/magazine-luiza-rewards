# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Api::Authentication do
  subject(:authentication) { described_class.new }

  describe '#generate_token' do
    subject(:token_info) { authentication.generate_token(username, password) }

    let(:username) { 'stars' }
    let(:password) { 'pass123' }
    let(:expected_expires_in) { 8979 }
    let(:expected_token) do
      'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ0TGxHNW9iY1JKaWpFTHFsNnFCdmtEbndDdzRkZH' \
        'FzMG5MVWFmMk1udkUwIn0.eyJqdGkiOiI1ODk4NGZhMC05YTFjLTQyYjktYmRmZi1lZjY0MmNiYWFjMDciLCJleH' \
        'AiOjE2OTU3NjQzMjksIm5iZiI6MCwiaWF0IjoxNjk1NzI4MzI5LCJpc3MiOiJodHRwczovL2tleWNsb2FrLXN0YW' \
        'dpbmcubHVpemFsYWJzLmNvbS9hdXRoL3JlYWxtcy9CMkIiLCJhdWQiOlsiZnVsbGNvbW1lcmNlLWFwaSIsImFjY2' \
        '91bnQiXSwic3ViIjoiY2JlMTRkYmQtMjkyYS00NzIzLWE4MTEtNGUzOWIyMDI5M2IxIiwidHlwIjoiQmVhcmVyIi' \
        'wiYXpwIjoicHJvZ3JhbWFzLXBhcmNlaXJvLXRlc3RlLW1hZ2FsdS1wbGF0Zm9ybS1hcGkiLCJhdXRoX3RpbWUiOj' \
        'AsInNlc3Npb25fc3RhdGUiOiI4YjM4Mzc4Ny1lZTVlLTRmYzctYWYwNC0wN2Q3MjA0MDBlZTIiLCJhY3IiOiIxIi' \
        'wicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYW' \
        'Njb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm' \
        '9maWxlIl19fSwic2NvcGUiOiJwcm9maWxlIGVtYWlsIiwiY2xpZW50SWQiOiJwcm9ncmFtYXMtcGFyY2Vpcm8tdG' \
        'VzdGUtbWFnYWx1LXBsYXRmb3JtLWFwaSIsInBhcnRuZXJfaWQiOiIxNjg1MSIsImNsaWVudEhvc3QiOiIxNDguNT' \
        'kuNzIuMjU0IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY2' \
        '91bnQtcHJvZ3JhbWFzLXBhcmNlaXJvLXRlc3RlLW1hZ2FsdS1wbGF0Zm9ybS1hcGkiLCJjaGFubmVsX2lkIjoiMy' \
        'IsImNsaWVudEFkZHJlc3MiOiIxNDguNTkuNzIuMjU0IiwiZW1haWwiOiJzZXJ2aWNlLWFjY291bnQtcHJvZ3JhbW' \
        'FzLXBhcmNlaXJvLXRlc3RlLW1hZ2FsdS1wbGF0Zm9ybS1hcGlAcGxhY2Vob2xkZXIub3JnIn0.iO75kDgr6q2EBp' \
        'bZANpghKdvb_bXz_lroQ05SM4mLysgwRsAkuZqy6HnvNGIGbxTUCLb_kfl953qdNA-vx_Qnwc8EpOOkX7JWSFGbN' \
        '95gwkZ7Cn0wwbryYrtmC-jqoKhI9eiPRipdzexBu1fK0mmBh3Gp5tlB1m6nD1BBvwCpPwY4sf3Lblmh_d6eDRntM' \
        'PYlyc4X0SOS3jA2a1gJXWZC0q3n0ktIFti02wsGc2W64Yii958fRKXHJQosHgrKBAhdBVnM4jAsRjr8ieWz7OtIe' \
        'u4q9jevBJJLWS9dFlfi88zrsjItsl2Gwlemo9_Gi64UfH87Heug8S8SMpjef4udQ'
    end

    context 'when successful', vcr: { cassette_name: 'success_authentication_request' } do
      it { is_expected.to be_a(MagazineLuizaRewardsV2::TokenInfo) }
      it { expect(token_info.access_token).to be_a(String) }
      it { expect(token_info.expires_in).to be_a(Integer) }
      it { expect(token_info.access_token).to eq(expected_token) }
      it { expect(token_info.expires_in).to eq(expected_expires_in) }
    end

    context 'when unsuccessful', vcr: { cassette_name: 'unsuccessful_authentication_request' } do
      let(:username) { 'wrong_username' }

      it do
        expect { token_info }.to raise_error(MagazineLuizaRewardsV2::Exceptions::UnauthorizedError)
      end
    end
  end
end
