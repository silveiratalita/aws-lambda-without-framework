async function handler(event, context) {
    console.log('Ambiente...', JSON.stringify(process.env,  null,  2))
    console.log('Evento...', JSON.stringify(event, null, 2))
    
    return {
        talita: "Talita aqui de novo, dessa vez fazendo um update na minha função lambda.",
        msg:"Corujinha voando voando voando...."
    }
}
module.exports={handler}