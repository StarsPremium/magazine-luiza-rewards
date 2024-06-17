# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Api::Authentication do
  subject(:authentication) { described_class.new }

  describe '#generate_token' do
    subject(:token_info) { authentication.generate_token(username, password) }

    let(:username) { 'stars' }
    let(:password) { 'pass123' }
    let(:expected_expires_in) { 8979 }
    let(:expected_token) do
      'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ0TGxHNW9iY1JKaWpFTHFsNnFCdmtEbndDdzRkZHFz' \
        'MG5MVWFmMk1udkUwIn0.eyJqdGkiOiI1ODk4NGZhMC05YTFjLTQyYjktYmRmZi1lZjY0MmNiYWFjMDciLCJleHAiOj' \
        'E2OTU3NjQzMjksIm5iZiI6MCwiaWF0IjoxNjk1NzI4MzI5LCJpc3MiOiJodHRwczovL2tleWNsb2FrLXN0YWdpbmcu' \
        'bHVpemFsYWJzLmNvbS9hdXRoL3JlYWxtcy9CMkIiLCJhdWQiOlsiZnVsbGNvbW1lcmNlLWFwaSIsImFjY291bnQiXS' \
        'wic3ViIjoiY2JlMTRkYmQtMjkyYS00NzIzLWE4MTEtNGUzOWIyMDI5M2IxIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoi' \
        'cHJvZ3JhbWFzLXBhcmNlaXJvLXRlc3RlLW1hZ2FsdS1wbGF0Zm9ybS1hcGkiLCJhdXRoX3RpbWUiOjAsInNlc3Npb2' \
        '5fc3RhdGUiOiI4YjM4Mzc4Ny1lZTVlLTRmYzctYWYwNC0wN2Q3MjA0MDBlZTIiLCJhY3IiOiIxIiwicmVhbG1fYWNj' \
        'ZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2' \
        'xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2Nv' \
        'cGUiOiJwcm9maWxlIGVtYWlsIiwiY2xpZW50SWQiOiJwcm9ncmFtYXMtcGFyY2Vpcm8tdGVzdGUtbWFnYWx1LXBsYX' \
        'Rmb3JtLWFwaSIsInBhcnRuZXJfaWQiOiIxNjg1MSIsImNsaWVudEhvc3QiOiIxNDguNTkuNzIuMjU0IiwiZW1haWxf' \
        'dmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtcHJvZ3JhbWFzLXBhcm' \
        'NlaXJvLXRlc3RlLW1hZ2FsdS1wbGF0Zm9ybS1hcGkiLCJjaGFubmVsX2lkIjoiMyIsImNsaWVudEFkZHJlc3MiOiIx' \
        'NDguNTkuNzIuMjU0IiwiZW1haWwiOiJzZXJ2aWNlLWFjY291bnQtcHJvZ3JhbWFzLXBhcmNlaXJvLXRlc3RlLW1hZ2' \
        'FsdS1wbGF0Zm9ybS1hcGlAcGxhY2Vob2xkZXIub3JnIn0.iO75kDgr6q2EBpbZANpghKdvb_bXz_lroQ05SM4mLysg' \
        'wRsAkuZqy6HnvNGIGbxTUCLb_kfl953qdNA-vx_Qnwc8EpOOkX7JWSFGbN95gwkZ7Cn0wwbryYrtmC-jqoKhI9eiPR' \
        'ipdzexBu1fK0mmBh3Gp5tlB1m6nD1BBvwCpPwY4sf3Lblmh_d6eDRntMPYlyc4X0SOS3jA2a1gJXWZC0q3n0ktIFti' \
        '02wsGc2W64Yii958fRKXHJQosHgrKBAhdBVnM4jAsRjr8ieWz7OtIeu4q9jevBJJLWS9dFlfi88zrsjItsl2Gwlemo' \
        '9_Gi64UfH87Heug8S8SMpjef4udQ'
    end

    context 'when successful', vcr: { cassette_name: 'success_authentication_request' } do
      it { is_expected.to be_a(MagazineLuizaRewards::TokenInfo) }
      it { expect(token_info.access_token).to be_a(String) }
      it { expect(token_info.expires_in).to be_a(Integer) }
      it { expect(token_info.access_token).to eq(expected_token) }
      it { expect(token_info.expires_in).to eq(expected_expires_in) }
    end

    context 'when unsuccessful', vcr: { cassette_name: 'unsuccessful_authentication_request' } do
      let(:username) { 'wrong_username' }

      it do
        expect { token_info }.to raise_error(MagazineLuizaRewards::Exceptions::UnauthorizedError)
      end
    end
  end
end
