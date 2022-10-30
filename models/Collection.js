
module.exports = (sequelize, DataTypes) => {
    const Collection = sequelize.define('Collection', {
        name: DataTypes.STRING,
        description: DataTypes.STRING,
        id_user: DataTypes.INTEGER

    }, { tableName: 'collections', timestamps: false })

    return Collection
}