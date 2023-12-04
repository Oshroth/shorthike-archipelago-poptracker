---[[
function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

function feathers(normalF, easyF, bucket, n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1

    local minfeathers = 0

    if easy(n) then
        minfeathers = easyF
    elseif normal(n) then
        minfeathers = normalF
    elseif hard(n) then
        minfeathers = 0
    end

    if has("bucket") and bucket < minfeathers then
        minfeathers = bucket
    end

    print(minfeathers)

    return has("feather", minfeathers)
end

function seashells(n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    return has("shell", 15)
end

-- Logic Difficulty

function easy(n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    return has("easy")
end

function normal(n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    return has("normal")
end

function hard(n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    return has("hard")
end