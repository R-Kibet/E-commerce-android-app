const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
    try{
        const token = req.header("x-auth-token");
        if(!token)
        return res.status(401).json({msg: "NO auth token access denied"});

        const verify = jwt.verify(token, "passwordKey");
        if (!verified)
            return res
                .status(401)
                .json({msg: "Token verification failed, authorization denied"})

        req.User = verify.id;
        req.token = token;
        next();
    } catch (e) {
        res.status(500).json({error: err.message});
    }

}

module.exports = auth;