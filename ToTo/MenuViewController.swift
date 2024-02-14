import UIKit

class MenuViewController: UITableViewController {
    let sections = ["Entrée", "Pizza"]

    let entreeItems = [
        ("Garlic bread", "Du pain legèrement croustillant parfumé à l’ail", "3,50€", "entree1"),
        ("Potatoes", "Quartiers de pommes de terre dorés au four", "3,50€", "entree2")
    ]

    let pizzaItems = [
        ("Margarita", "La classique base tomate et fromage", "10€", "pizza1"),
        ("Végétarienne", "Base tomate, légumes de saison et fromage", "12€", "pizza2"),
        ("Peperoni", "Base tomate, peperoni et fromage", "13,50€", "pizza3"),
        ("4 fromages", "Base crème, emmental, morbier, chèvre et gorgonzola", "12,50€", "pizza4")
    ]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return entreeItems.count
        case 1:
            return pizzaItems.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell

        switch indexPath.section {
        case 0:
            let (title, description, price, imageName) = entreeItems[indexPath.row]
            cell.configureCell(title: title, description: description, price: price, imageName: imageName)
        case 1:
            let (title, description, price, imageName) = pizzaItems[indexPath.row]
            cell.configureCell(title: title, description: description, price: price, imageName: imageName)
        default:
            break
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

class MenuCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    func configureCell(title: String, description: String, price: String, imageName: String) {
        itemImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        descriptionLabel.text = description
        priceLabel.text = price
    }
}

