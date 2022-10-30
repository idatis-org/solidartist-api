module.exports = (sequelize, DataTypes) => {
    const Complaint = sequelize.define('Complaint', {
        id_user_reported: DataTypes.INTEGER,
        id_user_reporting: DataTypes.INTEGER,
        motive: DataTypes.STRING

    }, { tableName: 'complaints', timestamps: false })

    return Complaint
}