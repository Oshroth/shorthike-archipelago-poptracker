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
    bucket = tonumber(bucket)

    local minfeathers = 0

    if easy(n) then
        minfeathers = tonumber(easyF)
    elseif normal(n) then
        minfeathers = tonumber(normalF)
    elseif hard(n) then
        minfeathers = 0
    end

    if has("bucket") and bucket < minfeathers then
        minfeathers = bucket
    end

    print(minfeathers)

    return has("feather", minfeathers)
end

function shop(cost, n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    cost = tonumber(cost)

    returnBool = true

    if has("shop1") then
        returnBool = has("rod")
    elseif has("shop2") then
        returnBool = has("shovel")
    elseif has("shop3") then
        returnBool = has("rod") and has("shovel")
    elseif has("shop4") then
        returnBool = has("goldrod")
    elseif has("shop5") then
        returnBool = has("goldrod") and has("shovel")
    end
    
    if cost == 40 then
        if has("40") then
            return returnBool
        else
            return true
        end
    elseif cost == 100 then
        if has("100") or has("40") then
            return returnBool
        else
            return true
        end
    elseif cost == 400 then
        return returnBool
    end
end

function race(n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    if easier_races(n) then
        return has("shoes")
    else
        return true
    end
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

function easier_races(n)
    if n == nil then; n = 0; end
    if n > 10 then; return false; end -- detect 10th step when trying to resolve and abort
    n = n + 1
    return has("easier_races")
end
