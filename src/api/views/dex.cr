module DexView

    def get_dex(request)
        user = get_user request
        if user
            begin
                dex = Dex.query.where(user_id: user.id).to_a
                {dex: dex}.to_json
            rescue
                {error: "No Dexs found for user"}.to_json
                request.response.status_code = 401
            end
        else
            request.response.status_code = 403
        end
    end

end
